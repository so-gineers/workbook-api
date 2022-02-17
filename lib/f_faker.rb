# frozen_string_literal: true

module FFaker
  module EducationSN
    # Study subjects generator
    module StudySubjects
      STUDY_SUBJECTS = %w[
        français
        anglais
        histoire
        géographie
        philosophie
        svt
        mathématiques
        physique
        chimie
        espagnol
        portugais
        latin
      ].freeze

      module_function

      def study_subject
        STUDY_SUBJECTS.shuffle.sample
      end
    end

    module Topics
      # French Essays generator
      module FrenchEssays
        TOPICS = [
          ' La violence se manifeste chaque jour dans le monde moderne.
            Quelles peuvent être selon vous les raisons de ce phélast_nameène ?
          Pensez-vous qu’il soit possible d’y remédier ?
          Vous appuierez vos réponses sur des exemples précis.',
          ' « A la lecture du roman Vol de nuit on découvre des hommes qui
          semblent renoncer à une vie familiale épanouie pour se donner
          entièrement à une vie d’action et de sacrifices.
          Partagez-vous un tel point de vue ?
          Justifiez votre réponse à l’aide d’arguments et d’exemples précis. »',
          ' « Etre homme, c’est précisément être responsable ». Expliquez et
          illustrez ces propos de Saint Exupéry. » ',
          ' « « Un pays en développement comme le Sénégal a beaucoup plus
          besoin d’ingénieurs et de techniciens que de sportifs de haut
          niveau », dit-on souvent. Exposez votre point de vue. » '
        ].freeze

        module_function

        def libelle
          TOPICS.shuffle.sample
        end
      end
    end
  end
end
