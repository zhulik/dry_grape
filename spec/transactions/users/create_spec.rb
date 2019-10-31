# frozen_string_literal: true

RSpec.describe Transactions::Users::Create do
  describe '#call' do
    subject { described_class.new.call(input) }

    let(:input) { { username: 'testuser', password: 'strong password' } }

    context 'when there is no user with the same username' do
      context 'when username and password are valid' do
        it 'creates a new user' do
          expect { subject }.to change { Application['persistence.repositories.users'].all.count }.by(1)
        end

        it 'returns a success' do
          expect(subject).to be_success
        end
      end
    end

    context 'when there is a user with the same username' do
      let!(:existing) { Factory[:user, username: 'testuser'] }

      it 'returns a failure' do
        expect(subject).to be_failure
      end
    end
  end
end
