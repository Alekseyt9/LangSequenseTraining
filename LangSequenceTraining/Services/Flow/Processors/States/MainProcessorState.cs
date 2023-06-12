

namespace LangSequenceTraining.Services
{
    public class MainProcessorState : ProcessorStateBase
    {
        public MainStateKind StateKind { get; set; }

        public List<MainExState> ExStates { get; set; }
    }
    
}
