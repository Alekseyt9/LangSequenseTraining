
using System.Reflection;

namespace LangSequenceTraining.Services
{
    internal class ProcessorProvider : IProcessorProvider
    {
        private Dictionary<string, IProcessor> _processorsMap;

        private void InitProcessors()
        {
            _processorsMap = new Dictionary<string, IProcessor>();

            var asms = AppDomain.CurrentDomain.GetAssemblies();
            foreach (var type in asms.SelectMany(x => x.GetTypes()))
            {
                if (typeof(IProcessor).IsAssignableFrom(type))
                {
                    var attr = type.GetCustomAttribute<ProcessorAttribute>();
                    if (attr != null)
                    {
                        _processorsMap.Add(attr.Name, (IProcessor)Activator.CreateInstance(type));
                    }
                }
            }
        }

        public IProcessor GetProcessor(string processorName)
        {
            if (_processorsMap == null)
            {
                InitProcessors();
            }

            if (!_processorsMap.ContainsKey(processorName))
            {
                throw new ArgumentException(processorName);
            }
            return _processorsMap[processorName];
        }

    }
}
