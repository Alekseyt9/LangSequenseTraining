
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Helpers
{
    public class ExChoiceItem
    {
        public string ExName { get; set; }

        public Sequence Sequence { get; set; }

        public bool IsFinish { get; set; }
    }
}
