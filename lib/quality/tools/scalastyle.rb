# frozen_string_literal: true

module Quality
  module Tools
    # Adds 'scalastyle' tool support to quality gem
    module Scalastyle
      private

      def scalastyle_args
        scala_files.join(' ')
      end

      def quality_scalastyle
        ratchet_quality_cmd('scalastyle',
                            args: scalastyle_args,
                            gives_error_code_on_no_relevant_code: true,
                            gives_error_code_on_violations: true) do |line|
          if line =~ /file=/
            1
          else
            0
          end
        end
      end
    end
  end
end
