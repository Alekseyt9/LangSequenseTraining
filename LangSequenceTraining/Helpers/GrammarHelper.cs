

namespace LangSequenceTraining.Helpers
{
    public static class GrammarHelper
    {
        public static string Declination(int num)
        {
            if (num > 100)
            {
                num = num % 100;
            }
            if (num >= 0 && num <= 20)
            {
                if (num == 0)
                {
                    return "ошибок";
                }
                else if (num == 1)
                {
                    return "ошибка";
                }
                else if (num >= 2 && num <= 4)
                {
                    return "ошибки";
                }
                else if (num >= 5 && num <= 20)
                {
                    return "ошибок";
                }
            }
            else if (num > 20)
            {
                string str;
                str = num.ToString();
                string n = str[str.Length - 1].ToString();
                int m = Convert.ToInt32(n);
                if (m == 0)
                {
                    return "ошибок";
                }
                else if (m == 1)
                {
                    return "ошибка";
                }
                else if (m >= 2 && m <= 4)
                {
                    return "ошибки";
                }
                else
                {
                    return "ошибок";
                }
            }
            return null;
        }
    }
}
