

namespace LangSequenceTraining.Services
{
    internal interface IProcessorProvider
    {
        IProcessor GetProcessor(string processorName);
    }
}
