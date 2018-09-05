class RelationshipsController < ApplicationController

	def create
		Relationship.create(
			follower_id: current_user.id,
			followed_id: params[:followed_id]
			)

		redirect_to user_url(params[:followed_id])
	end

	def destroy
		relationship = Relationship.find(params[:id])
		# user_id = relationship.followed_id
		relationship.destroy

		redirect_to user_url(relationship.followed_id)
	end

	# def destroy
	# 	Relationship.find_by[followed_id: params[:current_user.id]].destroy
	# end
end
