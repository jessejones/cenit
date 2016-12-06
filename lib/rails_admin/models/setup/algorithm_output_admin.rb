module RailsAdmin
  module Models
    module Setup
      module AlgorithmOutputAdmin
        extend ActiveSupport::Concern

        included do
          rails_admin do
            navigation_label 'Compute'
            weight -405
            visible false

            configure :records_count
            configure :input_parameters
            configure :created_at do
              label 'Recorded at'
            end

            extra_associations do
              association = Mongoid::Relations::Metadata.new(
                name: :records, relation: Mongoid::Relations::Referenced::Many,
                inverse_class_name: ::Setup::AlgorithmOutput.to_s, class_name: ::Setup::AlgorithmOutput.to_s
              )
              [RailsAdmin::Adapters::Mongoid::Association.new(association, abstract_model.model)]
            end

            show do
              field :created_at
              field :input_parameters
              field :records_count
            end

            fields :created_at, :input_parameters, :records_count
          end
        end

      end
    end
  end
end
