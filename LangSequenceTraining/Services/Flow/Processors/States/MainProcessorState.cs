

using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public class MainProcessorState : ProcessorStateBase
    {
        public MainStateKind StateKind { get; set; }

        public List<MainExState> ExStates { get; set; }

        public List<Sequence> CurSequences { get; set; }

    }
    
}
