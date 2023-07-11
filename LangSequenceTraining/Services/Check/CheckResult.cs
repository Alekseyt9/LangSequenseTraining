

namespace LangSequenceTraining.Services.Gpt
{
    public class CheckResult
    {
        public bool IsCorrect { get; set; }

        public string ErrorsMessage { get; set; }

        public string Translate { get; set; }

        public string Corrected { get; set; }

    }
}
