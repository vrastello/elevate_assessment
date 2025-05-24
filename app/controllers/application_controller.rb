class ApplicationController < ActionController::API
  private

  def render_serializer(serializer, root: nil)
    render json: serializer.serialize_with_root(root:), status: :ok
  end
end
