

namespace LangSequenceTraining.Helpers
{
    public static class GrammarHelper
    {
        public static string NumDeclination(int num, string[] words)
        {
            if (num > 100)
            {
                num = num % 100;
            }
            if (num >= 0 && num <= 20)
            {
                if (num == 0)
                {
                    return words[2];
                }
                else if (num == 1)
                {
                    return words[0];
                }
                else if (num >= 2 && num <= 4)
                {
                    return words[1];
                }
                else if (num >= 5 && num <= 20)
                {
                    return words[2];
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
                    return words[2];
                }
                else if (m == 1)
                {
                    return words[0];
                }
                else if (m >= 2 && m <= 4)
                {
                    return words[1];
                }
                else
                {
                    return words[2];
                }
            }
            return null;
        }
    }
}
