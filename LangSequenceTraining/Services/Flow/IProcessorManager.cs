

namespace LangSequenceTraining.Services
{
    internal interface IProcessorManager
    {
        Task Process(Guid userId, long channelId, string msg);

        Task DoTransition(ProcessorContext ctx, string nextProcName, TransitionMessageBase trMsg);

        void SaveProcState(ProcessorContext processorContext);
    }
}
