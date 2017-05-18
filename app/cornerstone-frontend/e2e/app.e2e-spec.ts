import { CornerstoneFrontendPage } from './app.po';

describe('cornerstone-frontend App', () => {
  let page: CornerstoneFrontendPage;

  beforeEach(() => {
    page = new CornerstoneFrontendPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
