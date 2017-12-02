require 'rails_helper'

describe PersonsController, type: :controller do
    context "with person" do
        let(:person) { create :person, :obama }
        describe "Go to person's show page" do
            it "tries to find the person" do
                expect(Person).to receive(:find).with(person.id.to_s)
                get 'show', {:id => person.id}
            end
            it "passes the person to the view" do
                get 'show', {:id => person.id}
                expect(assigns(:person)).to_not be_nil
            end
            it "finds the right person" do
                get 'show', {:id => person.id}
                expect(assigns(:person)).to eq(person)
            end
            it "redirects to the person's page" do
                get 'show', {:id => person.id}
                expect(response).to render_template(:show)
            end
        end

        describe "Go to a non-existant person's page" do
            it "tries to find the person" do
                expect(Person).to receive(:find).with(999.to_s)
                get 'show', {:id => 999}
            end
            it "tells the view that the person isn't found" do
                get 'show', {:id => 999}
                expect(assigns(:not_found)).to eq(true)
            end
        end
    end
end
