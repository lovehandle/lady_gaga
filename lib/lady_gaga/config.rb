module LadyGaga
  class Config

    class << self
      def user=(user)
        @user = user
      end

      def user
        @user
      end

      def password=(password)
        @password = password
      end

      def password
        @password
      end
    end

  end
end
