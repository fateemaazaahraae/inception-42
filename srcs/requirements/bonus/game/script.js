const emojiSetBase = [
  '🍎','🍌','🍇','🍓','🍍','🍉','🥝','🍒',
  '🥥','🍑','🍋','🥭','🫐','🍏','🍈','🍊',
  '🥬','🌽'
];

let flippedCards = [];
let lockBoard = false;
let moves = 0;
let cards = [];

function restartGame() {
  const difficulty = document.getElementById('difficulty').value;
  let rows, cols;

  switch (difficulty) {
    case 'easy':
      rows = 4; cols = 4; break;
    case 'medium':
      rows = 4; cols = 6; break;
    case 'hard':
      rows = 6; cols = 6; break;
  }

  const totalCards = rows * cols;
  const pairs = totalCards / 2;
  const emojis = emojiSetBase.slice(0, pairs);
  const shuffled = shuffle([...emojis, ...emojis]);

  const board = document.getElementById('game-board');
  board.innerHTML = '';
  board.style.gridTemplateColumns = `repeat(${cols}, 80px)`;
  moves = 0;
  document.getElementById('moves').textContent = moves;
  flippedCards = [];
  lockBoard = false;

  shuffled.forEach((emoji) => {
    const card = document.createElement('div');
    card.classList.add('card');
    card.dataset.emoji = emoji;
    card.innerHTML = `
      <div class="front"></div>
      <div class="back">${emoji}</div>
    `;
    card.addEventListener('click', () => flipCard(card));
    board.appendChild(card);
    cards.push(card);
  });
}

function shuffle(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}

function flipCard(card) {
  if (lockBoard || card.classList.contains('flipped') || flippedCards.includes(card)) return;

  card.classList.add('flipped');
  flippedCards.push(card);

  if (flippedCards.length === 2) {
    moves++;
    document.getElementById('moves').textContent = moves;
    checkMatch();
  }
}

function checkMatch() {
  const [card1, card2] = flippedCards;

  if (card1.dataset.emoji === card2.dataset.emoji) {
    card1.classList.add('matched');
    card2.classList.add('matched');
    flippedCards = [];
  } else {
    lockBoard = true;
    card1.classList.add('shake');
    card2.classList.add('shake');

    setTimeout(() => {
      card1.classList.remove('flipped', 'shake');
      card2.classList.remove('flipped', 'shake');
      flippedCards = [];
      lockBoard = false;
    }, 800);
  }
}

// Start the game on page load
window.onload = restartGame;
