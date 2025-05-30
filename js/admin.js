document.addEventListener('DOMContentLoaded', () => {
	// === Sidebar Menu Active Toggle ===
	const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');
	allSideMenu.forEach(item => {
		const li = item.parentElement;
		item.addEventListener('click', () => {
			allSideMenu.forEach(i => i.parentElement.classList.remove('active'));
			li.classList.add('active');
		});
	});

	// === Toggle Sidebar ===
	const menuBar = document.querySelector('#content nav .bx.bx-menu');
	const sidebar = document.getElementById('sidebar');
	menuBar.onclick = () => {
		sidebar.classList.toggle('hide');
	};

	// === Dark Mode Toggle ===
	const switchMode = document.getElementById('switch-mode');
	if (switchMode) {
		switchMode.addEventListener('change', function () {
			document.body.classList.toggle('dark', this.checked);
		});
	}

	// === Sidebar Navigation Section Switching ===
	document.querySelectorAll('#sidebar .side-menu a').forEach(link => {
		link.addEventListener('click', function (e) {
			// Only prevent default if this link has data-section attribute (sidebar internal navigation)
			if (this.hasAttribute('data-section')) {
				e.preventDefault();
				document.querySelectorAll('#sidebar .side-menu li').forEach(li => li.classList.remove('active'));
				this.parentElement.classList.add('active');

				document.querySelectorAll('.main-section').forEach(section => section.style.display = 'none');
				const targetId = this.getAttribute('data-section');
				const target = document.getElementById(targetId);
				if (target) target.style.display = 'block';
			}
			// If no data-section attribute, do nothing — allow default behavior (like logout)
		});
	});


	// === Add Product: Category Toggle Logic ===
	const categorySelect = document.getElementById('category_select');
	const addonWrapper = document.getElementById('addon_type_wrapper');
	const descriptionWrapper = document.getElementById('description_wrapper');

	categorySelect.addEventListener('change', function () {
		const selected = this.value;
		if (selected === 'addons') {
			addonWrapper.style.display = 'block';
			descriptionWrapper.style.display = 'none';
		} else {
			addonWrapper.style.display = 'none';
			descriptionWrapper.style.display = (selected === 'base_foods') ? 'block' : 'none';
		}
	});

	// === Price Input Buttons ===
	const priceInput = document.getElementById('price_input');
	const increaseBtn = document.getElementById('increase_price');
	const decreaseBtn = document.getElementById('decrease_price');

	increaseBtn?.addEventListener('click', () => {
		let value = parseFloat(priceInput.value) || 0;
		value += 0.25;
		priceInput.value = value.toFixed(2);
	});

	decreaseBtn?.addEventListener('click', () => {
		let value = parseFloat(priceInput.value) || 0;
		value = Math.max(0, value - 0.25);
		priceInput.value = value.toFixed(2);
	});

	// === Custom File Input Display ===
	const fileInput = document.getElementById('image_input');
	const fileTrigger = document.getElementById('image_trigger');
	const fileNameDisplay = document.getElementById('file_name');

	fileTrigger?.addEventListener('click', () => {
		fileInput.click();
	});

	fileInput?.addEventListener('change', () => {
		const file = fileInput.files[0];
		fileNameDisplay.textContent = file ? file.name : 'No file chosen';
	});
});

// === Store Tab Navigation ===
function showCategory(category) {
	const categories = ['base', 'beverage', 'addon', 'add'];
	categories.forEach(cat => {
		document.getElementById(cat).style.display = (cat === category) ? 'block' : 'none';
	});

	document.querySelectorAll('.store-tab').forEach(tab => {
		tab.classList.remove('active');
	});

	const btnMap = {
		base: 'Base Foods',
		beverage: 'Beverages',
		addon: 'Add Ons',
		add: 'Add Product'
	};

	document.querySelectorAll('.store-tab').forEach(tab => {
		if (tab.textContent.trim() === btnMap[category]) {
			tab.classList.add('active');
		}
	});

	// ADD PRODUCT NOTIFICATION
	const productForm = document.getElementById('productForm');
	const notification = document.getElementById('notification');

	if (productForm) {
		productForm.addEventListener('submit', function (e) {
			e.preventDefault(); // Stop form from refreshing the page

			const formData = new FormData(productForm);

			fetch('actions/add_product.php', {
				method: 'POST',
				body: formData
			})
			.then(res => res.text())
			.then(data => {
				if (data.includes('success')) {
					// Show notification
					notification.style.display = 'block';
					notification.textContent = 'Product added successfully!';

					// Reset form fields
					productForm.reset();

					// Hide after 3 seconds
					setTimeout(() => {
						notification.style.display = 'none';
					}, 3000);
				} else {
					notification.style.display = 'block';
					notification.style.backgroundColor = '#f8d7da';
					notification.style.color = '#721c24';
					notification.style.borderColor = '#f5c6cb';
					notification.textContent = 'Error adding product.';
				}
			})
			.catch(error => {
				console.error('Error:', error);
				notification.style.display = 'block';
				notification.style.backgroundColor = '#f8d7da';
				notification.style.color = '#721c24';
				notification.style.borderColor = '#f5c6cb';
				notification.textContent = 'Something went wrong.';
			});
		});
	}
}


function openDeleteModal(id, table) {
	if (confirm("Are you sure you want to delete this item?")) {
		fetch("actions/delete_product.php", {
			method: "POST",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: `id=${encodeURIComponent(id)}&table=${encodeURIComponent(table)}`
		})
		.then(response => response.text())
		.then(data => {
			if (data.trim() === "success") {
				alert("Product deleted successfully.");
				// Remove the deleted product's row from the table:
				const selector = `a[onclick*="'${id}'"][onclick*="'${table}'"]`; // find the delete link with matching id & table
				const deleteLink = document.querySelector(selector);
				if (deleteLink) {
					const row = deleteLink.closest('tr');
					if (row) row.remove();
				}
				// No page reload
			} else {
				alert("Error deleting product: " + data);
			}
		})
		.catch(error => {
			console.error("Fetch error:", error);
			alert("Network error while deleting product.");
		});
	}
}
