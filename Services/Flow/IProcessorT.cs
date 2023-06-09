namespace LangSequenceTraining.Services
{
    internal interface IProcessorT<T> : IProcessor
    {
        void Process(T state, string msg);
    }
}
