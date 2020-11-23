

using UnityEngine;


namespace hjcd.level
{
    public class Operator
    {


        public static bool DoRelationalOperator(float v1, float v2, RelationalOperator op)
        {
            if (op == RelationalOperator.EQUAL)
            {
                return v1 == v2;
            }

            else if (op == RelationalOperator.LESS_THAN)
            {
                return v1 < v2;
            }

            else if (op == RelationalOperator.GREATER_THAN)
            {
                return v1 > v2;
            }

            else if (op == RelationalOperator.NOT_EQUAL)
            {
                return v1 != v2;
            }

            else if (op == RelationalOperator.GREATER_THAN_OR_EQUAL)
            {
                return v1 >= v2;
            }

            else if (op == RelationalOperator.LESS_THAN_OR_EQUAL)
            {
                return v1 <= v2;
            }

            Debug.Log("不存在的RelationalOperator:" + op);

            return false;
        }


        public static float DoArithmeticOperator(float v1, float v2, ArithmeticOperator op)
        {
            if (op == ArithmeticOperator.ADD)
            {

                return v1 + v2;
            }
            else if (op == ArithmeticOperator.REDUCE)
            {

                return v1 - v2;
            }
            else if (op == ArithmeticOperator.MULTIPLICATION)
            {

                return v1 * v2;

            }
            else if (op == ArithmeticOperator.EXCEPT)
            {

                return v1 / v2;
            }

            Debug.Log("不存在的ArithmeticOperator:" + op);

            return v1;
        }

        public static float DoSimpleArithmeticOperator(float v1, float v2, SimpleArithmeticOperator op)
        {
            if (op == SimpleArithmeticOperator.ADD)
            {

                return v1 + v2;
            }
            else if (op == SimpleArithmeticOperator.REDUCE)
            {

                return v1 - v2;
            }
            else if (op == SimpleArithmeticOperator.ASSIGNMENT)
            {

                v1 = v2;

            }
            Debug.Log("不存在的SimpleArithmeticOperator:" + op);

            return v1;
        }

        public static float DoSimpleArithmeticOperatorValue(float v, SimpleArithmeticOperator op)
        {
            if (op == SimpleArithmeticOperator.REDUCE)
            {
                return -v;
            }
            return v;
        }
    }


}





