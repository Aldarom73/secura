module Api
  module V1
    class DisbursementsController < ApplicationController
      before_action :validate_params, only: [:index]

      # Only the index action is permitted
      def index
        @errors = false
        if params[:merchant_id] == nil && params[:start_at] == nil
          disbursements = Disbursement.all
        elsif params[:start_at] == nil
          disbursements = Disbursement.where(merchant_id: params[:merchant_id])
        elsif params[:merchant_id] == nil
          start_time
          if @errors == false
            disbursements = Disbursement.where(start_at: @monday_previous_redondo)
          end
        else
          start_time
          if @errors == false
            disbursements = Disbursement.where(merchant_id: params[:merchant_id]).and(Disbursement.where(start_at: @monday_previous_redondo))
          end
        end
        if @errors == false
          render json: disbursements
        else
          render json: {status: 'ERROR', message: 'Invalid date'}, status: 400
        end
      end

      private
        def start_time
          @errors = false
          now = params[:start_at].to_datetime
          now = Time.utc(now.year, now.month, now.day)
          if now.wday == 1
            @monday_previous_redondo = now
          else
            @monday_previous_redondo = now - (now.wday == 0 ? 6 : (now.wday - 1)).days
          end
        rescue
          @monday_previous_redondo = Time.now
          @errors = true
        end

        def validate_params
          if params[:merchant_id] != nil
            params[:merchant_id].to_i
          end
        rescue
          @errors = true
          render json: {status: 'ERROR', message: params[:merchant_id]}, status: 400
        end
    end
  end
end
