

namespace LangSequenceTraining.Services
{
    internal interface IProcessor
    {
        void Process(ProcessorContext ctx, ProcessorStateBase procState, TransitionMessageBase trMsg);
    }
}
