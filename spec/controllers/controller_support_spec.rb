require 'spec_helper'

describe Boomerang::ControllerSupport do
  describe '#redirect_away' do
    controller do
      def index
        redirect_away '/another/path'
      end
    end

    it 'redirects to the given path' do
      get :index
      response.should redirect_to('/another/path')
    end

    it 'stores current request path in the session' do
      request.stubs(:fullpath).returns('/full/request/path')
      get :index
      session[:boomerang_return_path].should eql('/full/request/path')
    end
  end

  describe '#redirect_back' do
    describe '(in general)' do
      controller do
        def index
          redirect_back '/fallback/path'
        end
      end

      it 'redirects to the stored return path' do
        session[:boomerang_return_path] = '/stored/request/path'
        get :index
        response.should redirect_to('/stored/request/path')
      end

      it 'redirects to the fallback path if no stored path found' do
        get :index
        response.should redirect_to('/fallback/path')
      end

      it 'removes return path from the session' do
        session[:boomerang_return_path] = '/stored/request/path'
        get :index
        session[:boomerang_return_path].should be_nil
      end
    end

    describe '(when no fallback path given)' do
      controller do
        def index
          redirect_back
        end
      end

      it 'redirects to the root path' do
        get :index
        response.should redirect_to('/')
      end
    end
  end
end