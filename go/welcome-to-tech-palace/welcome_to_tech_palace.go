package techpalace

import "strings"

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
	welcomeTemplate := "Welcome to the Tech Palace, "
	upperCustomer := strings.ToUpper(customer)
	return welcomeTemplate + upperCustomer
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	styling := strings.Repeat("*", numStarsPerLine)
	return styling + "\n" + welcomeMsg + "\n" + styling
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	rawMsgBody := strings.Split(oldMsg, "\n")[1]
	msgBody := strings.Trim(rawMsgBody, "*")
	trimmedMsgs := strings.TrimSpace(msgBody)
	return trimmedMsgs
}
