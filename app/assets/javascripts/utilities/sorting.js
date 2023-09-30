document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  const table = document.querySelector('table')

  const rows = table.querySelectorAll('tr')
  const sortedRows = []
  const arrowUp = this.querySelector('.octicon-arrow-up')
  const arrowDown = this.querySelector('.octicon-arrow-down')

  for (let i = 1; i < rows.length; i++) {
      sortedRows.push(rows[i])
  }

  if (arrowUp.classList.contains('hide')) {
      sortedRows.sort(compareRowsAsc)
      arrowUp.classList.remove('hide')
      arrowDown.classList.add('hide')
  } else {
      sortedRows.sort(compareRowsDesc)
      arrowDown.classList.remove('hide')
      arrowUp.classList.add('hide')
  }

  const sortedTable = document.createElement('table')
  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  const sortedtHead = sortedTable.createTHead()
  sortedtHead.appendChild(rows[0])

  const sortedtBody = sortedTable.createTBody()
  sortedtBody.append(...sortedRows)

  sortedTable.appendChild(sortedtBody)

  table.replaceWith(sortedTable)

}

function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
