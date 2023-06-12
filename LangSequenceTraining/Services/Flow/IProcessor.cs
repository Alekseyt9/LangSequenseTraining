

namespace LangSequenceTraining.Services
{
    internal interface IProcessor
    {
        Task Process(ProcessorContext ctx, ProcessorStateBase procState, TransitionMessageBase trMsg);
    }
}
