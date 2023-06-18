

namespace LangSequenceTraining.Services
{
    internal interface ICheckServiceProvider
    {
        ICheckService Get(Guid userId);
    }
}
