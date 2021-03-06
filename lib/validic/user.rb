# encoding: utf-8

module Validic
  module User

    ##
    # Get User id base on `access_token`
    # 
    # @return id
    def me(options={})
      options = {
        access_token: options[:access_token]
      }
      response = get("/#{Validic.api_version}/me.json", options)
      response if response
    end

    ##
    # POST User info for provisioning base on `access_token`
    #
    # @params[:organization_id] -- organization_id -- String
    # @params[:access_token] -- organization's access_token -- String
    # @params[:uid] -- uid for the new user -- String
    # @params[:height] -- info for user -- Integer
    # @params[:weight] -- info for user -- String
    # @params[:location] -- info for user -- String
    # @params[:gender] -- info for user -- String
    # @params[:birth_year] -- info for user -- String
    #
    # @return user object
    def user_provision(options={})
      organization_id = options[:organization_id]
      options = {
        access_token: options[:access_token],
        user: {
          uid: options[:uid],
          profile: {
            height: options[:height],
            gender: options[:gender],
            location: options[:location],
            weight: options[:weight]
          }
        }
      }
      response = post("/#{Validic.api_version}/organizations/#{organization_id}/users.json", options)
      response if response
    end

    ##
    #
    # PUT request for suspending a user
    #
    # @params[:organization_id] -- String
    # @params[:access_token] -- String -- organization's access_token
    # @params[:user_id] -- String -- user's ID to suspend
    # @params[:suspend] -- Boolean -- (1/0)
    #
    # @return user object
    def user_suspend(options={})
      organization_id = options[:organization_id]
      user_id = options[:user_id]
      options = {
        suspend: options[:suspend],
        access_token: options[:access_token]
      }

      response = put("/#{Validic.api_version}/organizations/#{organization_id}/users/#{user_id}.json", options)
      response
    end
  end
end
