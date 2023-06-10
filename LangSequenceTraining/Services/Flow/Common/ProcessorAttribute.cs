

namespace LangSequenceTraining.Services
{
    [AttributeUsage(AttributeTargets.Class)]
    internal class ProcessorAttribute : Attribute
    {
        public ProcessorAttribute(string name)
        {
            Name = name;
        }

        public string Name { get; set; }
    }
}
