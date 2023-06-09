
namespace LangSequenceTraining.Services
{
    internal interface IProcessorManager
    {
        void Process(Guid userId, string msg);
    }
}
