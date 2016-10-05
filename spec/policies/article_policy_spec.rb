require 'spec_helper'

describe ArticlePolicy do
  subject { ArticlePolicy.new(user, article) }

  let(:article) { create(:article) }

  context "for a user" do
    let(:user) { nil }

    it { should     permit(:show)    }
    it { should_not permit(:create)  }
    it { should_not permit(:new)     }
    it { should_not permit(:update)  }
    it { should_not permit(:edit)    }
    it { should_not permit(:destroy) }
  end

  context "for an author" do
    let(:user) { create(:user) }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should permit(:destroy) }
  end

  context "for an admin" do
    let(:user) { create(:user) }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should permit(:destroy) }
  end

end