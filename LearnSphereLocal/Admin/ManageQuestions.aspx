<%@ Page Title="Manage Questions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageQuestions.aspx.cs" Inherits="LearnSphereLocal.Admin.ManageQuestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .admin-container { max-width: 1000px; margin: 30px auto; }
    .form-section    { background: #f8f9fa; border: 1px solid #dee2e6;
                       border-radius: 8px; padding: 25px; margin-bottom: 30px; }
</style>

<div class="admin-container">
    <h2>Manage Quiz Questions</h2>
    <hr />

    <%-- Success / error messages --%>
    <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="alert d-block mb-3" />

    <%-- Quiz selector (auto-posts back to reload question list) --%>
    <div class="mb-4">
        <label class="form-label fw-bold">Select Quiz to Manage:</label>
        <asp:DropDownList ID="ddlQuiz" runat="server" CssClass="form-select"
            AutoPostBack="true" OnSelectedIndexChanged="ddlQuiz_SelectedIndexChanged">
        </asp:DropDownList>
    </div>

    <%-- ==================== ADD / EDIT FORM ==================== --%>
    <div class="form-section">
        <h5 id="lblFormTitle" runat="server">Add New Question</h5>
        <asp:HiddenField ID="hfQuestionID" runat="server" Value="0" />

        <div class="mb-3">
            <label class="form-label">Question Text <span class="text-danger">*</span></label>
            <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control"
                TextMode="MultiLine" Rows="3" />
            <asp:RequiredFieldValidator ID="rfvQuestion" runat="server"
                ControlToValidate="txtQuestion" CssClass="text-danger" Display="Dynamic"
                ErrorMessage="Question text is required." ValidationGroup="QuestionForm" />
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Option A <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtOptionA" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvA" runat="server"
                    ControlToValidate="txtOptionA" CssClass="text-danger" Display="Dynamic"
                    ErrorMessage="Option A is required." ValidationGroup="QuestionForm" />
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Option B <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtOptionB" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvB" runat="server"
                    ControlToValidate="txtOptionB" CssClass="text-danger" Display="Dynamic"
                    ErrorMessage="Option B is required." ValidationGroup="QuestionForm" />
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Option C <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtOptionC" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvC" runat="server"
                    ControlToValidate="txtOptionC" CssClass="text-danger" Display="Dynamic"
                    ErrorMessage="Option C is required." ValidationGroup="QuestionForm" />
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Option D <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtOptionD" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvD" runat="server"
                    ControlToValidate="txtOptionD" CssClass="text-danger" Display="Dynamic"
                    ErrorMessage="Option D is required." ValidationGroup="QuestionForm" />
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Correct Answer <span class="text-danger">*</span></label>
            <asp:DropDownList ID="ddlCorrect" runat="server" CssClass="form-select" Style="width:100px">
                <asp:ListItem Value="A" Text="A" />
                <asp:ListItem Value="B" Text="B" />
                <asp:ListItem Value="C" Text="C" />
                <asp:ListItem Value="D" Text="D" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Add Question"
            CssClass="btn btn-dark me-2" OnClick="btnSave_Click" ValidationGroup="QuestionForm" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel"
            CssClass="btn btn-secondary" OnClick="btnCancel_Click" CausesValidation="false" />
    </div>

    <%-- ==================== QUESTIONS GRID ==================== --%>
    <h5>Questions in Selected Quiz</h5>
    <asp:GridView ID="gvQuestions" runat="server"
        CssClass="table table-bordered table-hover mt-2"
        AutoGenerateColumns="false"
        DataKeyNames="QuestionID"
        EmptyDataText="No questions yet — add one above."
        OnRowCommand="gvQuestions_RowCommand">
        <Columns>
            <asp:BoundField DataField="QuestionID"   HeaderText="#"        ItemStyle-Width="40px" />
            <asp:BoundField DataField="QuestionText" HeaderText="Question" />
            <asp:BoundField DataField="CorrectAnswer" HeaderText="Answer"  ItemStyle-Width="70px" />
            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="130px">
                <ItemTemplate>
                    <asp:Button CommandName="EditQuestion"
                        CommandArgument='<%# Eval("QuestionID") %>'
                        Text="Edit" CssClass="btn btn-sm btn-warning me-1"
                        runat="server" CausesValidation="false" />
                    <asp:Button CommandName="DeleteQuestion"
                        CommandArgument='<%# Eval("QuestionID") %>'
                        Text="Delete" CssClass="btn btn-sm btn-danger"
                        OnClientClick="return confirm('Delete this question? This cannot be undone.');"
                        runat="server" CausesValidation="false" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

</asp:Content>
