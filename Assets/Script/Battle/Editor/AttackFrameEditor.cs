
using System;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

namespace Battle
{
    [CustomEditor(typeof(AttackFrame), true)]
    public class AttackFrameEditor : Editor
    {
        AttackFrame asset;

        string[] hitAnimations = { "None", "HitSoft", "HitHeavy", "HitHaulBack", "HitBeatBack", "HitDead", "HitFly", "HitFlowUp" };
        string[] hitAnimationsAir = { "None", "HitFlowLoop", "AirHitSoft", "AirHitSoftUp", "AirHitHeavy", "AirHitDrop", "AirHitFly" };


        public static bool cameraEffectEdit;

        CameraEffectSet cameraEffectPack;
        List<string> cameraEffectNames = new List<string>();

        string folderName;

        void OnEnable()
        {
            asset = target as AttackFrame;
            cameraEffectPack = AssetDatabase.LoadAssetAtPath<CameraEffectSet>("Assets/ResourcesAsset/Setting/CameraEffectPack.asset");

            cameraEffectNames.Clear();
            cameraEffectNames.Add("Select Template");
            foreach (var template in cameraEffectPack.templates)
            {
                cameraEffectNames.Add(template.name);
            }
        }

        private void UpdatePath()
        {
            string path = AssetDatabase.GetAssetPath(asset);
            string folder = Path.GetDirectoryName(path).Replace("\\", "/");
            string[] strs = folder.Split('/');
            folderName = strs[strs.Length - 1];
            asset.filePath = $"{folderName}/{asset.name}";
        }

        public override void OnInspectorGUI()
        {
            UpdatePath();

            GUI.skin.font = CustomEditorStyles.font;

            if (target is BulletAttackFrame)
            {
                EditBulletAttackConfig();
                EditBeAttackConfig();
                EditCameraConfig();

                GUILayout.Space(15);

                EditorGUILayout.TextField("Lua Path", asset.filePath);

                GUILayout.Space(5);

                if (GUILayout.Button("Generate Bullet Lua Config File", GUILayout.Height(30)))
                {
                    BattleEditorUtility.GenerateAttackFrameLua(asset);
                }
            }
            else if (target is TrapAttackFrame)
            {
                EditTrapAttackConfig();
                EditBeAttackConfig();
                EditCameraConfig();

                GUILayout.Space(15);

                EditorGUILayout.TextField("Lua Path", asset.filePath);

                GUILayout.Space(5);

                if (GUILayout.Button("Generate Trap Lua Config File", GUILayout.Height(30)))
                {
                    BattleEditorUtility.GenerateAttackFrameLua(asset);
                }
            }
            else
            {
                EditAttackConfig();
                EditAttackEffectConfig();
                EditBeAttackConfig();
                EditCameraConfig();

                GUILayout.Space(15);

                EditorGUILayout.TextField("Lua Path", asset.filePath);

                GUILayout.Space(5);

                if (GUILayout.Button("Generate Lua Config File", GUILayout.Height(30)))
                {
                    BattleEditorUtility.GenerateAttackFrameLua(asset);
                }
            }

            GUILayout.Space(5);

            EditorUtility.SetDirty(asset);

        }

        void EditAttackConfig()
        {
            GUILayout.Space(10);
            GUILayout.Label("攻击检测", CustomEditorStyles.titleLabel);
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.attackCheckType = (AttackCheckType)EditorGUILayout.EnumPopup("攻击检测方式", asset.attackCheckType);
            /*if (asset.attackCheckType==AttackCheckType.BoneNogs)
            {
                asset.boneNogType = (BoneNogType)EditorGUILayout.EnumPopup("检测：骨骼", asset.boneNogType);
                asset.attackRadius = EditorGUILayout.FloatField("攻击检查半径", asset.attackRadius, CustomEditorStyles.textField);
            }*/
            if (asset.attackCheckType == AttackCheckType.Range)
            {
                asset.attackRangePosition = asset.attackCheckVector;
                asset.attackRangePosition = EditorGUILayout.Vector3Field("中心位置", asset.attackRangePosition);
                asset.attackCheckVector = asset.attackRangePosition;

                asset.attackRangeTarget = EditorGUILayout.Toggle("优先目标", asset.attackRangeTarget);

                asset.attackRangeRadius = asset.attackRadius;
                asset.attackRangeRadius = EditorGUILayout.FloatField("范围半径", asset.attackRangeRadius, CustomEditorStyles.textField);
                asset.attackRadius = asset.attackRangeRadius;
            }
            else if (asset.attackCheckType == AttackCheckType.Ray)
            {
                asset.attackRayStart = EditorGUILayout.Vector3Field("射线起点", asset.attackRayStart);
                asset.attackRayEnd = EditorGUILayout.Vector3Field("射线终点", asset.attackRayEnd);
            }
            else if (asset.attackCheckType == AttackCheckType.Box)
            {
                asset.attackBoxCenter = EditorGUILayout.Vector3Field("盒子中心", asset.attackBoxCenter);
                asset.attackBoxSize = EditorGUILayout.Vector3Field("盒子宽高长", asset.attackBoxSize);
                asset.attackBoxAngle = EditorGUILayout.FloatField("盒子角度", asset.attackBoxAngle);
            }
            else if (asset.attackCheckType == AttackCheckType.Sector)
            {
                asset.attackSectorPosition = EditorGUILayout.Vector3Field("扇形原点", asset.attackSectorPosition);
                asset.attackSectorDirection = EditorGUILayout.FloatField("扇形方向", asset.attackSectorDirection);
                asset.attackSectorRadius = EditorGUILayout.FloatField("扇形半径", asset.attackSectorRadius);
                asset.attackSectorAngle = EditorGUILayout.FloatField("扇形角度", asset.attackSectorAngle);
            }
            else if (asset.attackCheckType == AttackCheckType.Ring)
            {
                asset.attackRingPosition = EditorGUILayout.Vector3Field("环形中心位置", asset.attackRingPosition);
                asset.attackRingRadiusMin = EditorGUILayout.FloatField("环形内圈半径", asset.attackRingRadiusMin);
                asset.attackRingRadiusMax = EditorGUILayout.FloatField("环形外圈半径", asset.attackRingRadiusMax);
            }
            else if (asset.attackCheckType == AttackCheckType.Rect)
            {
                asset.attackRectCenter = EditorGUILayout.Vector3Field("矩形中心", asset.attackRectCenter);
                asset.attackRectAngle = EditorGUILayout.FloatField("矩形方向", asset.attackRectAngle);
                asset.attackRectSize = EditorGUILayout.Vector3Field("矩形尺寸(X宽Z长)", asset.attackRectSize);
            }
            /*
            else if (asset.attackCheckType == AttackCheckType.Ball)
            {
                asset.attackBallCenter = EditorGUILayout.Vector3Field("球体中心", asset.attackBallCenter);
                asset.attackBallRadius = EditorGUILayout.FloatField("球体半径", asset.attackBallRadius);
            }
            else if (asset.attackCheckType == AttackCheckType.Circle)
            {
                asset.attackCirclePosition = EditorGUILayout.Vector3Field("圆形中心", asset.attackCirclePosition);
                asset.attackCircleRadius = EditorGUILayout.FloatField("圆形半径", asset.attackCircleRadius);
            }*/


            GUILayout.Label("* 基于角色中心：X负左正右, Y高度，Z负后正前。");
            GUILayout.Space(5);
            asset.attackDelayTime = EditorGUILayout.FloatField("攻击检测延迟", asset.attackDelayTime, CustomEditorStyles.textField);
            asset.attackCheckTime = EditorGUILayout.FloatField("攻击检测时长", asset.attackCheckTime, CustomEditorStyles.textField);
            GUILayout.Space(5);
            asset.debugPause = EditorGUILayout.Toggle("暂停调试开关", asset.debugPause);

            EditorGUILayout.EndVertical();

        }

        void EditBulletAttackConfig()
        {
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.debugPause = EditorGUILayout.Toggle("暂停调试开关", asset.debugPause);
            EditorGUILayout.EndVertical();
        }

        void EditTrapAttackConfig()
        {
            GUILayout.Space(10);
            GUILayout.Label("攻击检测", CustomEditorStyles.titleLabel);
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.attackCheckType = (AttackCheckType)EditorGUILayout.EnumPopup("攻击检测方式", asset.attackCheckType);

            if (asset.attackCheckType == AttackCheckType.Range)
            {
                asset.attackRangePosition = asset.attackCheckVector;
                asset.attackRangePosition = EditorGUILayout.Vector3Field("中心位置", asset.attackRangePosition);
                asset.attackCheckVector = asset.attackRangePosition;

                asset.attackRangeTarget = EditorGUILayout.Toggle("优先目标", asset.attackRangeTarget);

                asset.attackRangeRadius = asset.attackRadius;
                asset.attackRangeRadius = EditorGUILayout.FloatField("范围半径", asset.attackRangeRadius, CustomEditorStyles.textField);
                asset.attackRadius = asset.attackRangeRadius;
            }
            else if (asset.attackCheckType == AttackCheckType.Ray)
            {
                asset.attackRayStart = EditorGUILayout.Vector3Field("射线起点", asset.attackRayStart);
                asset.attackRayEnd = EditorGUILayout.Vector3Field("射线终点", asset.attackRayEnd);
            }
            else if (asset.attackCheckType == AttackCheckType.Box)
            {
                asset.attackBoxCenter = EditorGUILayout.Vector3Field("盒子中心", asset.attackBoxCenter);
                asset.attackBoxSize = EditorGUILayout.Vector3Field("盒子宽高长", asset.attackBoxSize);
                asset.attackBoxAngle = EditorGUILayout.FloatField("盒子角度", asset.attackBoxAngle);
            }
            else if (asset.attackCheckType == AttackCheckType.Sector)
            {
                asset.attackSectorPosition = EditorGUILayout.Vector3Field("扇形原点", asset.attackSectorPosition);
                asset.attackSectorDirection = EditorGUILayout.FloatField("扇形方向", asset.attackSectorDirection);
                asset.attackSectorRadius = EditorGUILayout.FloatField("扇形半径", asset.attackSectorRadius);
                asset.attackSectorAngle = EditorGUILayout.FloatField("扇形角度", asset.attackSectorAngle);
            }
            else if (asset.attackCheckType == AttackCheckType.Ring)
            {
                asset.attackRingPosition = EditorGUILayout.Vector3Field("环形中心位置", asset.attackRingPosition);
                asset.attackRingRadiusMin = EditorGUILayout.FloatField("环形内圈半径", asset.attackRingRadiusMin);
                asset.attackRingRadiusMax = EditorGUILayout.FloatField("环形外圈半径", asset.attackRingRadiusMax);
            }
            else if (asset.attackCheckType == AttackCheckType.Rect)
            {
                asset.attackRectCenter = EditorGUILayout.Vector3Field("矩形中心", asset.attackRectCenter);
                asset.attackRectAngle = EditorGUILayout.FloatField("矩形方向", asset.attackRectAngle);
                asset.attackRectSize = EditorGUILayout.Vector3Field("矩形尺寸(X宽Z长)", asset.attackRectSize);
            }
            /*
            else if (asset.attackCheckType == AttackCheckType.Ball)
            {
                asset.attackBallCenter = EditorGUILayout.Vector3Field("球体中心", asset.attackBallCenter);
                asset.attackBallRadius = EditorGUILayout.FloatField("球体半径", asset.attackBallRadius);
            }
            else if (asset.attackCheckType == AttackCheckType.Circle)
            {
                asset.attackCirclePosition = EditorGUILayout.Vector3Field("圆形中心", asset.attackCirclePosition);
                asset.attackCircleRadius = EditorGUILayout.FloatField("圆形半径", asset.attackCircleRadius);
            }*/
            GUILayout.Label("* 基于陷阱中心：X负左正右, Y高度，Z负后正前。");
            GUILayout.Space(5);
            asset.debugPause = EditorGUILayout.Toggle("暂停调试开关", asset.debugPause);

            EditorGUILayout.EndVertical();

            /*
            GUILayout.Space(10);
            GUILayout.Label("移动设置", CustomEditorStyles.titleLabel);
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.moveToggle = EditorGUILayout.Toggle("Move Toggle", asset.moveToggle);
            asset.moveSpeed = EditorGUILayout.FloatField("Move Speed", asset.moveSpeed);
            int pathCount = EditorGUILayout.DelayedIntField("Move Paths", asset.movePaths.Count);
            if(pathCount < asset.movePaths.Count)
            {
                asset.movePaths = asset.movePaths.GetRange(0, pathCount);
            }
            else
            {
                int need = pathCount - asset.movePaths.Count;
                if (need>0)
                {
                    for (var i = 0; i < need; i++)
                    {
                        asset.movePaths.Add(Vector3.zero);
                    }
                }
            }
            EditorGUILayout.BeginVertical();
            for (var i=0;i<asset.movePaths.Count;i++)
            {
                asset.movePaths[i] = EditorGUILayout.Vector3Field(" ", asset.movePaths[i]);
            }
            EditorGUILayout.EndVertical();
            EditorGUILayout.EndVertical();
            */
        }


        void EditAttackEffectConfig()
        {
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);

            EffectSet set = AssetDatabase.LoadAssetAtPath<EffectSet>("Assets/ResourcesAsset/" + asset.attackEffectPath + ".asset");
            set = (EffectSet)EditorGUILayout.ObjectField("攻击特效", set, typeof(EffectSet), false);

            string path = AssetDatabase.GetAssetPath(set);
            string savePath = "Assets/ResourcesAsset/";
            int pathStart = path.IndexOf(savePath) + savePath.Length;

            if (path.Length > savePath.Length)
            {
                asset.attackEffectPath = path.Substring(pathStart).Replace(".asset", "");
            }
            else
            {
                asset.attackEffectPath = "";
            }
            EditorGUILayout.LabelField("Effect Path", asset.attackEffectPath.Replace("Assets/ResourcesAsset/", ""));

            GUILayout.EndVertical();
        }

        void EditBeAttackConfig()
        {
            GUILayout.Space(10);
            GUILayout.Label("受击配置", CustomEditorStyles.titleLabel);
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.beAttackedAction = GetSortString(hitAnimations, EditorGUILayout.Popup("受击动作", GetStringSort(hitAnimations, asset.beAttackedAction), hitAnimations));
            asset.beAttackedActionAir = GetSortString(hitAnimationsAir, EditorGUILayout.Popup("空中受击动作", GetStringSort(hitAnimationsAir, asset.beAttackedActionAir), hitAnimationsAir));
            asset.beAttackedFlowUp = EditorGUILayout.FloatField("受击浮空程度", asset.beAttackedFlowUp, CustomEditorStyles.textField);
            asset.beAttackedReset = EditorGUILayout.Toggle("受击动作重置", asset.beAttackedReset);
            EditorGUILayout.EndVertical();

            GUILayout.Space(10);
            GUILayout.Label("定帧设置", CustomEditorStyles.titleLabel);
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.freezeFrameDelay = EditorGUILayout.IntField("定帧延迟", asset.freezeFrameDelay);
            asset.freezeFrameTarget = EditorGUILayout.IntField("目标定帧数", asset.freezeFrameTarget);
            asset.freezeFrameSelf = EditorGUILayout.IntField("自身定帧数", asset.freezeFrameSelf);
            //asset.freezeFrameTargetAir = EditorGUILayout.IntField("目标定帧数(空中)", asset.freezeFrameTargetAir);
            //asset.freezeFrameSelfAir = EditorGUILayout.IntField("自身定帧数(空中)", asset.freezeFrameSelfAir);
            EditorGUILayout.EndVertical();
        }

        void EditCameraConfig()
        {
            GUILayout.Space(10);
            GUILayout.Label("相机效果", CustomEditorStyles.titleLabel);

            EditorGUILayout.BeginVertical(EditorStyles.helpBox);

            int selectSort = EditorGUILayout.Popup("选择模板", 0, cameraEffectNames.ToArray());
            CameraEffectTemplate template;
            if (selectSort > 0)
            {
                template = cameraEffectPack.templates[selectSort - 1];
                asset.cameraEffectId = template.id;
            }
            else
            {
                template = cameraEffectPack.GetTemplateById(asset.cameraEffectId);
            }

            if (template != null)
            {
                asset.cameraEffectId = EditorGUILayout.IntField("效果ID", asset.cameraEffectId);
                EditorGUILayout.TextField("效果名", template.name);
            }
            else
            {
                EditorGUILayout.IntField("效果ID", asset.cameraEffectId);
                EditorGUILayout.TextField("效果名", "No Template!");
            }

            GUILayout.EndVertical();
        }

        public int GetStringSort(string[] arr, string item)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                if (arr[i] == item)
                {
                    return i;
                }
            }
            return 0;
        }

        public string GetSortString(string[] arr, int sort)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                if (i == sort)
                {
                    return arr[i];
                }
            }
            return "None";
        }
    }

}