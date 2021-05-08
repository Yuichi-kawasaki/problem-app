class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  def show
     @user = User.find(params[:id])
     rooms = current_user.user_rooms.pluck(:room_id)
     user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

     if user_rooms.nil? 
       @room = Room.new
       @room.save
       UserRoom.create(user_id: @user.id, room_id: @room.id)
       UserRoom.create(user_id: current_user.id, room_id: @room.id)
     else
       @room = user_rooms.room
     end
     @chats = @room.chats.order(id: :ASC)
     @chat = Chat.new(room_id: @room.id)
   end

   def create
     # binding.irb
     @chat = current_user.chats.build(chat_params)
     if @chat.save
       respond_to do |format|
          format.js { render "create"}
       end
     else
       respond_to do |format|
          format.js { render "failed"}
       end
     end
   end

   private
   def chat_params
     params.require(:chat).permit(:message, :room_id)
   end
   def setup_users
    @to_user = User.find(params[:id])
    @ids = [@to_user.id,current_user.id]
  end
end
