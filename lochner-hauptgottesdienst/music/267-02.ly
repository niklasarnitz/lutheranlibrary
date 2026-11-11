\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 267, printed p. 242.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key c \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { a'1 a'1 a'1 a'1 f'\breve e'1 d'1 e'\breve \bar "|" f'1 f'1 f'1 f'\breve f'1 g'1 a'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Un -- ser täg -- lich Brod gib uns "heut." Und ver -- gib uns uns -- re "Schuld," }
    \new PianoStaff <<
      \new Staff { \clef treble \global <f' a'>1 r1 r1 r1 <d' f'>\breve r1 r1 <cis' e'>\breve \bar "|" r1 r1 r1 r1*2 <d' f'>1 <d' g'>1 <cis' a'>\breve }
      \new Staff { \clef bass \global <f c'>1 r1 r1 r1 <d a>\breve r1 r1 <a, a>\breve \bar "|" r1 r1 r1 r1*2 <d a>1 <bes, d>1 <a, f>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
