using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint
{

    [Serializable]
    public class CameraEffect : IExport
    {
        public int templateId   = 0; //模板Id
        public bool appoint     = false;
        public Vector2 center   = new Vector2(0.5f,0.5f);
        public CameraEffect Clone() {
            CameraEffect p = new CameraEffect();
            p.templateId = this.templateId;
            return p;
        }
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent += 1;
            sb.Append(ExportUtils.KV(nameof(templateId), templateId, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(appoint), appoint, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(center), center, indent, newLine));
            indent -=  1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }


        public void OnDraw()
        {
            EditorGUILayout.BeginVertical(GUI.skin.box);
            /*            var cameraEffectTemplates = Utils.GetCameraEffectTemplates();
                        int selectIndex = 0;
                        string[] names = new string[cameraEffectTemplates.Count + 1];
                        names[0] = "无效果[0]";
                        for (int i = 0; i < cameraEffectTemplates.Count; i++)
                        {
                            names[i + 1] = cameraEffectTemplates[i].name + string.Format("[{0}]", cameraEffectTemplates[i].id);
                            if (cameraEffectTemplates[i].id == templateId) {
                                selectIndex = i+1;
                            }
                        }
                        selectIndex = Utils.Popup("相机效果",selectIndex, names);
                        if (selectIndex >= 1)
                        {
                            var template = cameraEffectTemplates[selectIndex - 1];
                            templateId = template.id;
                            if (template.type == CameraEffectType.RadialBlur) {
                                this.appoint = Utils.Toggle("指定Center", appoint);
                                if (this.appoint) {
                                    this.center = EditorGUILayout.Vector2Field("Center", this.center);
                                }

                            }

                        }
                        else {
                            templateId = 0;
                        }*/
            Utils.LabelTip("CameraEffect not found",UnityEditor.MessageType.Error);

            EditorGUILayout.EndVertical();
        }
     
       
     
    }
   
}