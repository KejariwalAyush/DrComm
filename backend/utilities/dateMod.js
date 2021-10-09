exports.getAge = dateString => {
    let today = new Date();
    let birthDate = new Date(dateString);
    let age = today.getFullYear() - birthDate.getFullYear();
    let m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
    return age;
}

exports.increaseTime = (t, hours, mins, secs) => {
    t.setTime(t.getTime()+hours*60*60*1000+mins*60*1000+secs*1000)
    return t
}