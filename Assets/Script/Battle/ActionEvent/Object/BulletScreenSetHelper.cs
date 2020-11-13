using DG.Tweening;
using System.Collections.Generic;
using UnityEngine;

namespace Battle
{
    public class BulletScreenSetHelper : MonoBehaviour
    {
        BulletScreenSet asset;

        float lastUpdateTime;
        float deltaTime;

        int frameCount = 0;
        int shootDelay = 0;

        public float previewSpeed = 5;
        public float previewLength = 5;
        public int previewInterval = 5;



        public List<BulletScreenSetBall> ballList = new List<BulletScreenSetBall>();

        public void DoUpdate(BulletScreenSet asds)
        {
            asset = asds;

            frameCount += 1;

            //Debug.LogError(frameCount);

            float curTime = Time.realtimeSinceStartup;
            lastUpdateTime = Mathf.Min(lastUpdateTime, curTime);

            deltaTime = curTime - lastUpdateTime;

            CreateBulletScreen();

            UpdateBalls();

            lastUpdateTime = curTime;

        }


        void CreateBulletScreen()
        {
            Vector3 startAngle = Vector3.zero;
            Vector3 deltaAngle = frameCount * asset.moveAngle;

            for (var i = 0; i <= asset.splitCount; i++)
            {
                Vector3 direc = asset.directionVector.normalized;
                direc = Quaternion.Euler(deltaAngle) * direc;

                if (i == 0)
                {
                    ShootBall(direc);
                }
                else
                {
                    if (frameCount >= asset.splitDelay * i)
                    {
                        startAngle += asset.splitAngle;

                        if (asset.splitWay == BulletShootSplitWay.Add || asset.splitWay == BulletShootSplitWay.AddAndReduce)
                        {
                            ShootBall(Quaternion.Euler(startAngle) * direc);
                        }
                        if (asset.splitWay == BulletShootSplitWay.Reduce || asset.splitWay == BulletShootSplitWay.AddAndReduce)
                        {
                            ShootBall(Quaternion.Euler(-startAngle) * direc);
                        }
                    }
                }

            }
        }


        void ShootWay()
        {

        }

        void ShootBall(Vector3 direc)
        {
            if (frameCount % previewInterval == 0)
            {
                BulletScreenSetBall ball = CreateBall();
                ballList.Add(ball);

                ball.Shoot(direc.normalized, previewLength, previewSpeed);
            }
        }

        void UpdateBalls()
        {
            for (var i = ballList.Count - 1; i >= 0; i--)
            {
                var ball = ballList[i];
                if (ball.isEnd)
                {
                    ballList.Remove(ball);
                    GameObject.DestroyImmediate(ball.gameObject);
                }
            }

        }

        public void ClearBalls()
        {
            for (var i = ballList.Count - 1; i >= 0; i--)
            {
                var ball = ballList[i];
                ballList.Remove(ball);
                GameObject.DestroyImmediate(ball.gameObject);
            }

            frameCount = 0;
        }

        BulletScreenSetBall CreateBall()
        {
            GameObject ball = GameObject.CreatePrimitive(PrimitiveType.Sphere);
            BulletScreenSetBall ballCpn = ball.AddComponent<BulletScreenSetBall>();
            ball.transform.SetParent(this.transform, false);
            ball.transform.localScale = Vector3.one * 0.1f;

            return ballCpn;
        }


    }
}
