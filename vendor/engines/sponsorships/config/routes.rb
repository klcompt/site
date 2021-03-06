#- Copyright 2011 Strange Loop LLC
#-
#- Licensed under the Apache License, Version 2.0 (the "License");
#- you may not use this file except in compliance with the License.
#- You may obtain a copy of the License at
#-
#-    http://www.apache.org/licenses/LICENSE-2.0
#-
#- Unless required by applicable law or agreed to in writing, software
#- distributed under the License is distributed on an "AS IS" BASIS,
#- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#- See the License for the specific language governing permissions and
#- limitations under the License.
#-



Refinery::Application.routes.draw do
  resources :sponsorships, :path => 'sponsors', :only => [:index]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :sponsorships, :except => :show do
      collection do
        post :update_positions
      end
    end
    resources :sponsorship_levels, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
