
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public class MainExHistoryItem
    {
        public string ExName { get; set; }

        public bool IsCorrect { get; set; }

        public Sequence Sequence { get; set; }

    }
}
