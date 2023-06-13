document.addEventListener('DOMContentLoaded', function() {
  var addButton = document.getElementById('add-goal');
  var goalsTable = document.getElementById('goals-table');

  addButton.addEventListener('click', function() {
    var newRow = document.createElement('tr');
    newRow.innerHTML = `
      <td><input type="text" name="goal_name[]" /></td>
      <td><input type="number" name="goal_number[]" /></td>
      <td><input type="number" name="achievement_number[]" /></td>
      <td><span class="achievement-rate">0%</span></td>
      <td><button type="button" class="remove-goal">削除</button></td>
    `;
    goalsTable.querySelector('tbody').appendChild(newRow);
  });

  goalsTable.addEventListener('input', function(event) {
    if (event.target.name === 'goal_number[]' || event.target.name === 'achievement_number[]') {
      updateAchievementRate(event.target.closest('tr'));
    }
  });

  function updateAchievementRate(row) {
    var goalNumber = parseInt(row.querySelector('input[name="goal_number[]"]').value);
    var achievementNumber = parseInt(row.querySelector('input[name="achievement_number[]"]').value);
    var achievementRate = (achievementNumber / goalNumber * 100).toFixed(2);
    if (isNaN(achievementRate)) {
      achievementRate = '0.00';
    }
    row.querySelector('.achievement-rate').textContent = achievementRate + '%';
  }

  goalsTable.addEventListener('click', function(event) {
    if (event.target.classList.contains('remove-goal')) {
      event.target.closest('tr').remove();
    }
  });
});