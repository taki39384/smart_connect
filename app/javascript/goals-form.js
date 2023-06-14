document.addEventListener('DOMContentLoaded', function() {
  var addButton = document.getElementById('add-goal');
  var goalsTable = document.getElementById('goals-table');
  var storageButton = document.getElementById('add-storage');

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

  storageButton.addEventListener('click', function(event) {
    event.preventDefault();
    saveData();
  });

  // ページロード時に保存したデータを復元する
  restoreData();

  function saveData() {
    var form = document.getElementById('goals-form');
    var formData = new FormData(form);
    var goalsData = [];

    formData.getAll('goal_name[]').forEach(function(name, index) {
      var goalNumber = formData.getAll('goal_number[]')[index];
      var achievementNumber = formData.getAll('achievement_number[]')[index];
      var achievementRate = (parseFloat(achievementNumber) / parseFloat(goalNumber) * 100).toFixed(2) + '%';
      goalsData.push({
        name: name,
        goalNumber: goalNumber,
        achievementNumber: achievementNumber,
        achievementRate: achievementRate
      });
    });

    // ローカルストレージにデータを保存する
    localStorage.setItem('goalsData', JSON.stringify(goalsData));

    alert('データが保存されました');
  }

  function restoreData() {
    var savedData = localStorage.getItem('goalsData');
    if (savedData) {
      var goalsData = JSON.parse(savedData);
      goalsData.forEach(function(data) {
        var newRow = document.createElement('tr');
        newRow.innerHTML = `
          <td><input type="text" name="goal_name[]" value="${data.name}" /></td>
          <td><input type="number" name="goal_number[]" value="${data.goalNumber}" /></td>
          <td><input type="number" name="achievement_number[]" value="${data.achievementNumber}" /></td>
          <td><span class="achievement-rate">${data.achievementRate}</span></td>
          <td><button type="button" class="remove-goal">削除</button></td>
        `;
        goalsTable.querySelector('tbody').appendChild(newRow);
        updateAchievementRate(newRow);
      });
    }
  }
});