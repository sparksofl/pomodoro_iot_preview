class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :finished, :user_id
end
