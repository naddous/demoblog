import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
it('Page renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<App />, div);
});

it('Check posts shown', () => {

});