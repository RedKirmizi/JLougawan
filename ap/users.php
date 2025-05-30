<main id="users-section" class="main-section" style="display: none;">
    <div class="head-title">
        <div class="left">
            <h1>Users</h1>
            <ul class="breadcrumb">
                <li>
                    <a href="#">Users</a>
                </li>
                <li><i class='bx bx-chevron-right'></i></li>
                <li>
                    <a class="active" href="#">All Users</a>
                </li>
            </ul>
        </div>
    </div>

    <!-- 🔽 Users Table Here -->
    <div class="table-data">
        <div class="order">
            <div class="head">
                <h3>Registered Users</h3>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Registered At</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sql = "SELECT * FROM users ORDER BY created_at DESC";
                    $result = $dbcon->query($sql);
                    while($row = $result->fetch_assoc()):
                    ?>
                    <tr>
                        <td><?= htmlspecialchars($row['user_id']) ?></td>
                        <td><?= htmlspecialchars($row['firstname'] . ' ' . $row['lastname']) ?></td>
                        <td><?= htmlspecialchars($row['email']) ?></td>
                        <td><?= htmlspecialchars($row['created_at']) ?></td>
                        <td>
                            <a href="#" onclick="event.preventDefault(); openDeleteModal2('<?= $row['user_id'] ?>')">Delete</a>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Delete User Confirmation Modal -->
    <div id="deleteModal2" style="display:none; position: fixed; top:0; left:0; width:100%; height:100%; 
        background: rgba(0,0,0,0.5); justify-content: center; align-items: center; z-index: 10000;">
        <div style="background: white; padding: 20px; border-radius: 8px; max-width: 400px; width: 90%;">
            <h3>Confirm Delete</h3>
            <p>Are you sure you want to delete this user?</p>
            <form id="deleteUserForm2" method="post" action="actions/delete_user.php">
                <input type="hidden" id="deleteId2" name="id" value="">
                <div style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 20px;">
                    <button type="button" onclick="closeDeleteModal2()" style="padding: 8px 15px;">Cancel</button>
                    <button type="submit" style="padding: 8px 15px; background-color: #d9534f; color: white; border: none; border-radius: 4px;">Delete</button>
                </div>
            </form>
        </div>
    </div>
</main>