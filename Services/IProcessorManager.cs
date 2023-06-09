

namespace LangSequenceTraining.Services
{
    internal interface IProcessorManager
    {
        void Process(Guid userId, long channelId, string msg);

        void DoTransition(string procName, ProcessorStateBase state);

    }
}
