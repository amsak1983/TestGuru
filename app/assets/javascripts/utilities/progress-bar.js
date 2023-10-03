document.addEventListener('turbolinks:load', () => {
  const progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
      calculatePercent(progressBar)
  }
})

function calculatePercent(progressBar) {
  const currentQuestion = progressBar.dataset.currentQuestion
  const questionsCount = progressBar.dataset.questionsCount

  let percent = Math.round(currentQuestion / questionsCount * 100) + '%'

  progressBar.style.width = percent
}
