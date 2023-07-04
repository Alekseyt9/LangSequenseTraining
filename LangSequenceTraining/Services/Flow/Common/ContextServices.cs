

namespace LangSequenceTraining.Services
{
    internal class ContextServices
    {
        private readonly ICheckServiceProvider _checkServiceProvider;
        private readonly ITelegramBot _telegramBot;
        private readonly IAppRepository _repository;
        private readonly IAppRepositoryA _repositoryA;
        private readonly IProcessorManager _processorManager;
        private readonly ITextToSpeech _textToSpeech;
        private readonly ILearningService _learningService;
        private readonly ISequenceProvider _sequenceProvider;

        public ISequenceProvider SequenceProvider => _sequenceProvider;

        public ICheckServiceProvider CheckServiceProvider => _checkServiceProvider;

        public IAppRepository Repository => _repository;

        public IAppRepositoryA RepositoryA => _repositoryA;

        public ITelegramBot TelegramBot => _telegramBot;

        public IProcessorManager ProcessorManager => _processorManager;

        public ITextToSpeech TextToSpeech => _textToSpeech;

        public ILearningService LearningService  => _learningService;

        public ContextServices(
            ICheckServiceProvider checkServiceProvider, ITelegramBot telegramBot, 
            IAppRepository repository, IAppRepositoryA repositoryA,
            IProcessorManager processorManager, 
            ITextToSpeech textToSpeech, ILearningService learningService,
            ISequenceProvider sequenceProvider)
        {
            _checkServiceProvider = checkServiceProvider;
            _telegramBot = telegramBot;
            _repository = repository;
            _repositoryA = repositoryA;
            _processorManager = processorManager;
            _textToSpeech = textToSpeech;
            _learningService = learningService;
            _sequenceProvider = sequenceProvider;
        }

    }
}
