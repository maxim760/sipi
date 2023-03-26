const toastBtn = document.querySelector(".toast-close")
const formCreateOrder = document.querySelector("#create-order-form")
const orderPrice = document.querySelector("#order-price")
const orderPriceDelivery = document.querySelector("#order-price-delivery")
const buttonsAddOrder = document.querySelectorAll(".button-add-order")
const badgeOrder = document.querySelector("#badge-order")
const addedGoods = document.querySelector("#collection-added-goods")
const filterOrderForm = document.querySelector("#filter-order-form")
const checkboxWithDelivery = document.querySelector("#withDelivery")
const selectChoise = document.querySelectorAll(".select-choise")

const selectOpts = {
    loadingText: 'Загрузка...',
    noResultsText: 'Не найдено',
    noChoicesText: 'Не найдено',
    itemSelectText: '',
    uniqueItemText: 'Только уникальные значения могут быть добавлены',
    customAddItemText: 'Могут быть добавлены только значения, соответствующие определенным условиям',
    placeholderValue: "Выберите нужные ингридиенты",
    removeItemButton: true,
    searchResultLimit: 30,
    addItemText: () => "",
}

if(selectChoise.length) {
    selectChoise.forEach(item => new Choices(item, selectOpts))
}

if(toastBtn) {
    toastBtn.addEventListener("click", (e) => {
        e?.target?.closest?.(".toast")?.remove?.()
    })
}

if(formCreateOrder) {
    const updatePrice = () => {
        const addedItemsToOrder = [...addedGoods.querySelectorAll(".collection-item")]
        const summaryPrice = addedItemsToOrder.reduce((acc, item) => {
            return acc + Number(item.dataset.price) * Number(item.dataset.count);
        }, 0)
        orderPrice.textContent = `${summaryPrice}₽`
    }
    const updateBadge = () => {
        const addedItemsToOrder = [...addedGoods.querySelectorAll(".collection-item")]
        const totalCount = addedItemsToOrder.reduce((acc, item) => acc + +(item.dataset.count || 1), 0)
        badgeOrder.classList.remove("active")
        badgeOrder.textContent = `${totalCount}`
        if(totalCount) {
            badgeOrder.classList.add("active")
        }
    }
    const updateInfo = () => {
        updatePrice()
        updateBadge()
    }
    buttonsAddOrder.forEach(btn => {
        btn.addEventListener("click", (event) => {
            const target = event.target
            const id = target.dataset.id
            const colItem = formCreateOrder.querySelector(`.collection-item[data-id='${id}']`)

            const inputs = formCreateOrder.querySelectorAll(".good-item");
            const countCurrentItem = [...inputs].filter(item => item.dataset.id === target.dataset.id).length
            const index = !inputs.length
                ? 0
                : Number(inputs[inputs.length - 1].dataset.index) + 1
            const addedInputHtml = `<input placeholder=" "  type="text" data-id="${target.dataset.id}" data-index="${index}" hidden class="validate good-item" name="goodsIds[]" field="goodsIds[]" value="${target.dataset.id}">`
            const addedListHtml = `
                <li class="collection-item" data-index="${index}" data-count="${countCurrentItem + 1}" data-price="${target.dataset.price}" data-id="${target.dataset.id}" style="display: flex; flex-direction: column">
                    <div>${target.dataset.name}</div>
                    <p class="card-content-item">Цена - <span class="card-content-item-value">${target.dataset.price}</span></p>
                    <p class="card-content-item">Кол-во - <span class="card-content-item-value count">${countCurrentItem + 1}</span></p>
                    <div class="buttons-list small buttons-list-order">
                       <button type="button" class="add-good waves-effect waves-light mini-btn btn-small">+1</button>
                        <button type="button" class="minus-good waves-effect waves-light mini-btn btn-small">-1</button>
                        <button type="button" class="remove-goods waves-effect waves-light mini-btn btn-small"><i class="material-icons">delete</i></button>
                    </div>
                </li>
            `
            if(colItem) {
                colItem.outerHTML = addedListHtml
            } else {
                addedGoods.insertAdjacentHTML("beforeend", addedListHtml)
            }
            formCreateOrder.insertAdjacentHTML("beforeend", addedInputHtml)
            updateInfo()
        })
    })
    addedGoods.addEventListener("click", (event) => {
        const colItem = event.target.closest(".collection-item")
        const countEl = colItem.querySelector(".count")
        if(!colItem) {
            return
        }
        if(event.target.closest(".remove-goods")) {
            const id = colItem.dataset.id
            formCreateOrder.querySelectorAll(`.collection-item[data-id='${id}']`).forEach(item => {
                item.remove()
            })
            formCreateOrder.querySelectorAll(`.good-item[data-id='${id}']`).forEach(item => {
                item.remove()
            })
        }
        if(event.target.closest(".add-good")) {
            const id = colItem.dataset.id
            const inputs = formCreateOrder.querySelectorAll(".good-item");
            const index = !inputs.length
                ? 0
                : Number(inputs[inputs.length - 1].dataset.index) + 1
            const addedInputHtml = `<input placeholder=" "  type="text" data-id="${id}" data-index="${index}" hidden class="validate good-item" name="goodsIds[]" field="goodsIds[]" value="${id}">`
            const newCount = +colItem.dataset.count + 1
            countEl.textContent = `${newCount}`
            colItem.dataset.count = `${newCount}`
            formCreateOrder.insertAdjacentHTML("beforeend", addedInputHtml)
        }
        if(event.target.closest(".minus-good")) {
            const id = colItem.dataset.id
            const inputs = formCreateOrder.querySelectorAll(".good-item");
            const newCount = +colItem.dataset.count - 1
            countEl.textContent = `${newCount}`
            colItem.dataset.count = `${newCount}`
            const inputForDel = [...inputs].find(item => item.dataset.id === id)
            inputForDel?.remove();
            if(newCount <= 0) {
                formCreateOrder.querySelectorAll(`.collection-item[data-id='${id}']`).forEach(item => {
                    item.remove()
                })
                formCreateOrder.querySelectorAll(`.good-item[data-id='${id}']`).forEach(item => {
                    item.remove()
                })
            }
        }
        updateInfo()
    })
}
if(filterOrderForm) {
    filterOrderForm.addEventListener("submit", (e) => {
        const inputs = formCreateOrder.querySelectorAll("input")
        for(let input of inputs) {
            input.style.display = "none"
            filterOrderForm.insertAdjacentElement("beforeend", input)
        }
    })
}

if(checkboxWithDelivery) {
    checkboxWithDelivery.addEventListener("change", (event) => {
        if(event.target.checked) {
            orderPriceDelivery.style.display = "block"
        } else {
            orderPriceDelivery.style.display = "none"
        }
    })
}