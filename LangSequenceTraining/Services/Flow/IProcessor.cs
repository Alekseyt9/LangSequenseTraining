

namespace LangSequenceTraining.Services
{
    internal interface IProcessor
    {
        Task Process(ProcessorContext ctx, TransitionMessageBase trMsg);
    }
}
