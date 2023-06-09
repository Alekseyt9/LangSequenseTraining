namespace LangSequenceTraining.Services
{
    internal interface IProcessor
    {
        void Process(object state, string msg);
    }
}
