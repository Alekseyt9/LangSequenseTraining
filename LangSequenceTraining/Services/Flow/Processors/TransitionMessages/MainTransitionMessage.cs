

using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class MainTransitionMessage : TransitionMessageBase
    {
        public string ExName { get; set; }

        public bool CheckResult { get; set; }

        public Sequence Sequence { get; set; }

        public bool IsReset { get; set; }

    }
}
