using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("创建特效")]
    public class CreateEffect : ExecuteNode
    {
        public List<Effect> childs = new List<Effect>();
        public override void NewUUID()
        {
            base.NewUUID();
            foreach (var child in childs)
            {
                child.NewUUID();
            }
        }
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV_LIST<Effect>(nameof(childs), childs, indent, newLine));
            return sb.ToString();
        }

        public void AddEffect() {
            Effect effect = new Effect();
            effect.Name = effect.GetDefaultName();//"特效" + effect.uid.Substring(0, 8);
            effect.Parent = this.Parent;
            effect.CreateObject();
            Node.SetActiveGameObject(effect.gameObject);
            childs.Add(effect);
        }


        Vector2 scrollPosition;
        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            if (Utils.Button("新增特效")) {
                this.AddEffect();
            }
            scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition);

            for (int i = 0; i < childs.Count; i++)
            {
                Effect effect = childs[i];
                effect.OnDraw(this);
            }
            EditorGUILayout.EndScrollView();
            DoDel();
        }

        public Effect Copy(Effect effect) {
            Effect newEffect = effect.Clone();
            this.childs.Add(newEffect);
            return newEffect;
        }
        private Effect preRemoveEffect;
        public void PreDel(Effect effect) {
            preRemoveEffect = effect;
        }
        private void DoDel() {
            if (preRemoveEffect!= null) {
                this.childs.Remove(preRemoveEffect);
                preRemoveEffect = null;
            }
        }

        public override void CreateObject()
        {
            base.CreateObject();
            foreach (var effect in childs)
            {
                effect.Parent = this.Parent;
                effect.CreateObject();
            }

        }
    }
}