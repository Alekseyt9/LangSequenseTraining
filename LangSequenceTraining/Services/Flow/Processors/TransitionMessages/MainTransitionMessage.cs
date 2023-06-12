

namespace LangSequenceTraining.Services
{
    internal class MainTransitionMessage : TransitionMessageBase
    {
        public string ExName { get; set; }

        public bool CheckResult { get; set; }
    }
}
